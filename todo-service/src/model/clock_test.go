package model

import (
	"fmt"
	"testing"
	"time"
)

func TestParseDateFor(t *testing.T) {
	dateFor := ParseDateFor("2050-01-01")
	fmt.Println(dateFor)

	if dateFor != time.Date(2050, 1, 1, 0, 0, 0, 0, time.UTC) {
		t.Error("parsing not valid")
	}
}

func TestFormatDateFor(t *testing.T) {

	dateFor := ParseDateFor("2050-01-01")

	formattedDate := FormatDateFor(dateFor)

	if formattedDate != "2050-01-01" {
		t.Error("actual formatted date does not match with the expected one")
	}

}
