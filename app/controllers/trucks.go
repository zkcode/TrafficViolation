/*
*	try to use ddliu go-httpclient package to
*	implement the client-server communication to retrieve
*	traffic violation information
*
*
*
*	author: Zhang Kui
*
 */
package controllers

import (
	"bytes"
	"encoding/csv"
	"fmt"
	"github.com/ddliu/go-httpclient"
	"github.com/revel/revel"
	"io"
	"os"
	_ "sort"
	"sync"
	"time"
)

const (
	MAINURL   string = "http://210.76.69.58/wfcx/query.jsp"
	SEARCHURL string = "http://210.76.69.58/wfcx/_queryCph.jsp"
	RESULTURL string = "http://210.76.69.58/wfcx/cphResultList.jsp"
	ImageUrl  string = "http://210.76.69.58/wfcx/captcha/_queryCph.jsp"

	USERAGENT = "GTT Agent"
	TIMEOUT   = 50
)

var (
	AllTrucks [](map[string]string)
	hc        = httpclient.NewHttpClient().Defaults(httpclient.Map{"reuseJar": true, "Accept-Encoding": "gzip,deflate,sdch"})
	jsession  string
	random    string = ""
	truckid   string = ""
)

type Trucks struct {
	*revel.Controller
}

func GetAllTrucks() [](map[string]string) {
	csvpath := revel.BasePath + "/data/trucks.csv"

	csvfile, err := os.Open(csvpath)
	if err != nil {
		fmt.Println(err)
		return nil
	}

	defer csvfile.Close()

	reader := csv.NewReader(csvfile)
	rawCsvData, err := reader.ReadAll()
	if err != nil {
		fmt.Println(err)
		return nil
	}

	newCsv := [](map[string]string){}

	for i := 0; i < len(rawCsvData); i++ {
		var sorter = struct {
			sync.RWMutex
			sortrow map[string]string
		}{sortrow: make(map[string]string)}

		for j := 0; j < len(rawCsvData[0]); j++ {
			sorter.Lock()
			sorter.sortrow[rawCsvData[0][j]] = rawCsvData[i][j]
			sorter.Unlock()
		}
		newCsv = append(newCsv, sorter.sortrow)
	}
	return newCsv
}

func (t *Trucks) Index() revel.Result {

	AllTrucks = GetAllTrucks()

	t.RenderArgs["AllTrucks"] = AllTrucks
	t.RenderArgs["TrucksNum"] = len(AllTrucks) - 1

	return t.Render()
}

func (t *Trucks) getImg(url string) io.Reader {
	fmt.Println("----------- 获取验证码 -----------")
	res, _ := hc.WithHeader("Accept-Language", "zh-CN,en-us").WithHeader("Referer", "http://localhost:9000").Get(url, nil)

	bodyBytes, _ := res.ReadAll()

	return bytes.NewReader(bodyBytes)
}

func (t *Trucks) getTo(url string) string {

	res, _ := hc.WithHeader("Accept-Language", "zh-CN,en-us").WithHeader("Referer", "http://localhost:9000").Get(url, nil)

	reshtml, _ := res.ToString()
	return reshtml
}

func (t *Trucks) ajaxTo(url string) string {
	num := t.Params.Get("hphm")   //"A70811"
	cat := t.Params.Get("hpzl")   //"大型汽车"
	ide := t.Params.Get("clsbdh") //"F05972"
	eng := t.Params.Get("djzsbh") // "8710021"
	cd := t.Params.Get("captcha")

	truckid = num
	fmt.Println(truckid, ": 查询中......")

	res, _ := hc.WithHeaders(map[string]string{
		"Accept-Language":  "zh-CN,en-us",
		"Accept":           "application/json,text/javascript,*/*",
		"Accept-Encoding":  "gzip,deflate",
		"Content-Type":     "application/json",
		"Referer":          "http://localhost:9000",
		"X-Requested-With": "XMLHttpRequest",
		"Origin":           "http://localhost:9000",
		"User-Agent":       "Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.91 Safari/537.36",
	}).Post(url, map[string]string{
		"hphm":    num,
		"hpzl":    cat,
		"clsbdh":  ide,
		"djzsbh":  eng,
		"captcha": cd,
	})

	respStr, _ := res.ToString()
	return respStr
}

func (t *Trucks) Image() revel.Result {

	t.Params.Bind(&random, "random")

	var url string

	if random == "" {
		url = ImageUrl
	} else {
		url = ImageUrl + "?random=" + random
	}

	myimage := t.getImg(url)
	return t.RenderBinary(myimage, "", "image/jpeg", time.Now())
}

func (t *Trucks) SearchJson() revel.Result {
	fmt.Println("----------- 查询违章 -----------")
	respStr := t.ajaxTo(SEARCHURL)

	return t.RenderHtml(respStr)
}

func (t *Trucks) Res() revel.Result {
	reshtml := t.getTo(RESULTURL)

	fmt.Println(truckid, ": 返回结果......")

	return t.RenderHtml(reshtml)
}
