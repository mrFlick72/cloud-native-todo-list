package model

import (
	"time"
)

func Now() time.Time {
	now := time.Now().UTC().Round(time.Second)
	return now
}

func ParseDateFor(date string) time.Time {
	parse, _ := time.Parse("2006-01-02", date)
	return parse.UTC()
}

func FormatDateFor(date time.Time) string {
	return date.Format("2006-01-02")
}
