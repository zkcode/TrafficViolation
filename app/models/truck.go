package models

import (
	"github.com/revel/revel"
	"time"
)

const (
	TRUCKCATBIG  = "大型汽车"
	TRUCKCATTAIL = "挂车"
)

type Truck struct {
	TruckNum   string
	Category   string
	Identifier string
	enginecode string
}

func (truck *Truck) Validate(v *revel.Validation) {
	v.Check(truck.TruckNum, revel.Required{})
	v.Check(truck.Category, revel.Required{})
	v.Check(truck.Identifier, revel.Required{})
	v.Check(truck.enginecode, revel.Required{})
}
