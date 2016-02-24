






<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<title>交通违法查询</title>
<link href="/wfcx/css/main.css" type="text/css" rel="stylesheet" />
<script src="/wfcx/js/jquery-1.6.2.min.js" type="text/javascript"></script>
<style>
.zt_from {width:430px !important;}
.zt_inp {width:270px !important;}
.zt_tit {width:120px;}
.zt_from_left .zt_tit {width:180px;}
.zt_from_left .zt_inp   {width:258px !important;}
.zt_from_left   {width:480px !important;}
.zt_inp .w_input {width:220px !important;}
.zt_title {height:40px;padding-left:10px;}
.zt_title .zt_t {color:#3495b2;font-size:16px;line-height:40px;font-weight:bold;}
.desc {padding:10px;font-size:14px;color:#333;line-height:150%;}
.bianhao2 {display:none;}
</style>
<script>

/** 检查当前值是否为空 */
function isNullValue(value) { 
    if (value == null || $.trim(value).length == 0) {
        return true;
    }
    return false;
};

/** 检查input是否填写 ，如为空并提示*/
function checkValue(inputID, message) {
    var value = $("#" + inputID).val();
    if (isNullValue(value)) {
        alert(message);
        $("#" + inputID).focus();
        return false;
    }
    return true;
}

$().ready(function(){
    
    
    $(".w_input").focus(function(){
          $(".w_input").css('border','1px solid #cad9e0');
          $(this).css('border',"2px solid #3a98b5");
              
    });
    
    $("#hpzl").bind("change",function(){
       if($(this).val() == "26" || $(this).val() == "27") {
          $(".bianhao2").show();
          $(".bianhao").hide();
       } else {
          $(".bianhao2").hide();
          $(".bianhao").show();
       }
    });
    
    $("#queryJsz").click(function() {
        if (checkValue("sfzmhm", "请填写驾驶证号码") && checkValue("xm", "请填写驾驶员姓名") 
                && checkValue("dabh", "请填写档案编号") && checkValue("jszValidateCode", "请输入验证码")) {
            $(".hidediv").show();
            $.post(
                    "_queryJsz.jsp",
                    {
                        "sfzmhm" : $("#sfzmhm").val(),
                        "xm" : $("#xm").val(),
                        "dabh" : $("#dabh").val(),
                        "captcha" : $("#jszValidateCode").val()
                    },
                    function(json){
                        var detail = json.detail;
                        var type = json.type;
                        if ("success" == type) {
                            location.href="/wfcx/jszResultList.jsp";
                        } else if ("fail" == type) {
                            $(".hidediv").hide();
                            alert(detail);
                            $('.jszyzm').attr('src', '/wfcx/captcha/_queryJsz.jsp?random='+Math.random());
                        }
                    },
                    "json"
            );
        }
    });
    
    $("#queryCph").click(function() {
        if (checkValue("hphm", "请填写车牌号码") && checkValue("hpzl", "请选择车牌种类") 
                && checkValue("clsbdh", "请填写车辆识别代号（后6位）") && checkValue("djzsbh", "请填写编号") && checkValue("cphValidateCode", "请输入验证码")) {
            $(".hidediv").show();
            $.post(
                    "_queryCph.jsp",
                    {
                        "hphm" : $("#hphm").val(),
                        "hpzl" : $("#hpzl").val(),
                        "clsbdh" : $("#clsbdh").val(),
                        "djzsbh" : $("#djzsbh").val(),
                        "captcha" : $("#cphValidateCode").val()
                    },
                    function(json){
                        var detail = json.detail;
                        var type = json.type;
                        if ("success" == type) {
                            location.href="/wfcx/cphResultList.jsp";
                        } else if ("fail" == type) {
                            $(".hidediv").hide();
                            alert(detail);
                            $('.cphyzm').attr('src', '/wfcx/captcha/_queryCph.jsp?random='+Math.random());
                        }
                    },
                    "json"
            );
            
        }
    });
});
</script>
</head>
<body>
<div class="hidediv" style="width:100%; height:100%; background-color:#D6D6D6; text-align:center;vertical-align: middle; display:none; z-index:100; position:fixed; top:0px; left:0px; opacity:0.7;filter:alpha(opacity=70);">
    <img src="/wfcx/images/loading.gif" alt="" style="width:150px;height:150px;vertical-align:middle;"/>
    <span style="display:inline-block;*display:inline;*zoom:1;height:100%;width:1px;margin-left:-1px;vertical-align:middle"></span>
</div>
<div class="zx1">
  <div class="head">
    <div class="head-con">
      <div class="head-top">
        <div class="logo"> <img src="/wfcx/images/logo.jpg" />
          <h1>办事大厅</h1>
          <div class="clear"></div>
        </div>
        <div class="right"> <a href="http://www.gdgajj.gov.cn">返回首页</a> </div>
        <div class="clear"></div>
      </div>
      <div class="head-center">
        <div class="con">
          <p>交通违法查询</p>
        </div>
      </div>
      <div class="head-bottom">
        <div class="con">
          <p><a href="http://www.gdgajj.gov.cn/acthall/">办事大厅</a> &nbsp;&gt;&nbsp;<span>交通违法查询</span></p>
        </div>
      </div>
    </div>
  </div>

<div style="width:950px;margin:0 auto;">
    <div class="zt_main">
        
        <div style="float:left;width:480px;">
        <div class="zt_title"><span class="zt_t">按车牌号查询交通违法信息</span></div>
        <div class="desc">请输入车牌号码、车牌种类、车辆识别代号后6位、机动车登记证书编号后7位(港澳入境车须输入编号)查询该车省内交通违法未处理记录</div>
        <div class="zt_from zt_from_left">
            <div class="zt_tit"></div>
            <div class="zt_inp"></div>
         
            <div class="zt_tit"><i>*</i>车牌号码：</div>
            <div class="zt_inp">
            粤 <input type="text" id="hphm" name="hphm" class="w_input" value="" style="width:200px !important;"/>
            </div>
            <div class="zt_tit"><i>*</i>车牌种类：</div>
            <div class="zt_inp">
            <select id="hpzl" name="hpzl">
                <option value="01" selected="selected">大型汽车</option>
                <option value="02">小型汽车</option>
                <option value="05">境外汽车</option>
                <option value="06">外籍汽车</option>
                <option value="07">两、三轮摩托车</option>
                <option value="11">境外摩托车</option>
                <option value="12">外籍摩托车</option>
                <option value="15">挂车</option>
                <option value="16">教练车</option> 
                <option value="20">临时入境汽车</option>
                <option value="21">临时入境摩托车</option>
                <option value="22">临时行驶汽车</option>
                <option value="23">公安警车</option>
                <option value="26">香港入境车</option>
                <option value="27">澳门入境车</option>
                <option value="99">其它</option>
            </select>
            </div>
            <div class="zt_tit"><i>*</i>车辆识别代号(后6位)：</div>
            <div class="zt_inp">
            <input type="text" id="clsbdh" name="clsbdh" class="w_input" value=""style="width:350px;"/>
            </div>
            <div class="zt_tit bianhao"><i>*</i>机动车登记证书编号(后7位)：</div>
            <div class="zt_tit bianhao2"><i>*</i>编号：</div>
            <div class="zt_inp">
            <input type="text" id="djzsbh" name="djzsbh" class="w_input" value=""style="width:350px;"/>
            </div>
            <div class="zt_tit bianhao2"></div>
            <div class="zt_inp bianhao2">
            (编号请见批准通知书，下图红框所示)
            </div> 
                <div class="zt_tit bianhao2"></div>
            <div class="zt_inp bianhao2">
            <img src="/wfcx/images/bianhao_1.jpg" width="220"/>
            </div> 
            <div class="zt_tit"><i>*</i>验证码：</div>
            <div class="zt_inp">
            <input id="cphValidateCode" name="cphValidateCode" type="text" style="width:150px;" class="w_input" value=""/>
                            
            </div>      
            <div class="zt_tit"></div>
            <div class="zt_inp">
                
                            <img class="cphyzm" src="/wfcx/captcha/_queryCph.jsp" onclick="this.src='/wfcx/captcha/_queryCph.jsp?random='+Math.random();" style="vertical-align: middle; cursor: hand;" title="看不清楚？点击换一张图" border="0"/>
                                &nbsp;&nbsp;&nbsp;看不清楚?请点击图片
            </div>
            <div class="cb"></div>
        </div>
        <div style="text-align:left;padding:10px;padding-left:0;"><input type="button" value="查询"  class="button_blue"  id="queryCph" name="queryCph"/><strong></strong></div>
    
        </div>
        
        <div style="width:10px;overflow:hidden;height:450px;margin-left:18px;border-left:1px dashed #ccc;float:left;"></div>
        
        <div style="float:right;width:430px;">
            <div class="zt_title"><span class="zt_t">按驾驶证号查询交通违法信息</span></div>
            <div class="desc">请输入驾驶证号码、姓名、档案编号查询本人省内交通违法未处理记录。</div>
            <div class="zt_from">
                <div class="zt_tit"></div>
                <div class="zt_inp"></div>
            
                <div class="zt_tit"><i>*</i>驾驶证号码：</div>
                <div class="zt_inp">
                <input type="text" id="sfzmhm" name="sfzmhm" class="w_input" value=""style="width:350px;"/>
                </div>
                <div class="zt_tit"><i>*</i>驾驶员姓名：</div>
                <div class="zt_inp">
                <input type="text" id="xm" name="xm" class="w_input" value=""style="width:350px;"/>
                </div>
                <div class="zt_tit"><i>*</i>档案编号：</div>
                <div class="zt_inp">
                <input type="text" id="dabh" name="dabh" class="w_input" value=""style="width:350px;"/>
                </div>
                <div class="zt_tit"><i>*</i>验证码：</div>
                <div class="zt_inp">
                <input id="jszValidateCode" name="jszValidateCode" type="text" style="width:150px;" class="w_input" value=""/>
                </div>
                <div class="zt_tit"></div>
                <div class="zt_inp">
                    
                                <img class="jszyzm" src="/wfcx/captcha/_queryJsz.jsp" onclick="this.src='/wfcx/captcha/_queryJsz.jsp?random='+Math.random();" style="vertical-align: middle; cursor: hand;" title="看不清楚？点击换一张图" border="0"/>
                                    &nbsp;&nbsp;&nbsp;看不清楚?请点击图片
                </div>
                <div class="cb"></div>
            </div>
            <div style="text-align:left;padding:10px;padding-left:0;"><input type="button" value="查询"  class="button_blue"  id="queryJsz" name="queryJsz"/><strong></strong></div>
        </div>
    <div class="cb"></div>
    
    </div>
</div>
<div class="foot">
 <div class="footlinks"><a href="http://www.gdgajj.gov.cn/jgsz/">机构设置</a> | <a href="http://www.gdgajj.gov.cn/build/">联系方式</a> | <a href="http://www.gdgajj.gov.cn/build/">网站地图</a> | <a href="http://www.gdgajj.gov.cn/build/">版权声明</a> | <a href="http://www.gdgajj.gov.cn/build/">流量统计</a></div>
 <div class="copyright">版权所有 2011 广东省公安厅交通管理局政务服务网<br/>未经许可不得转载及建立镜像 否则追究法律责任 粤ICP备05013198号</div>
</div>
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
  ga('create', 'UA-47323869-3', '210.76.69.58');
  ga('send', 'pageview');
</script>
</body>
</html>
