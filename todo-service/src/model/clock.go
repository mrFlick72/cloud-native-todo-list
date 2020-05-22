package model

import "time"

func Now() time.Time {
	now := time.Now().UTC().Round(time.Second)
	return now
}
