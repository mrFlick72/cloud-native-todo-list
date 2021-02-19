package clock

import (
	"time"
)

func Now() time.Time {
	now := time.Now().UTC().Round(time.Second)
	return now
}
func ToDay() time.Time {
	now := time.Now().UTC().Round(time.Hour)
	return time.Date(now.Year(), now.Month(), now.Day(), 0, 0, 0, 0, time.UTC)
}

func ParseDateFor(date string) time.Time {
	parse, _ := time.Parse("2006-01-02", date)
	return parse.UTC()
}

func FormatDateFor(date time.Time) string {
	return date.Format("2006-01-02")
}
