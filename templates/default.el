go-mode

(tpd "fmt.Println(" p ")")
(tppd "fmt.Printf(\"" (s name) ": %+v\\n\", " (s name) ")")
(tspf "fmt.Sprintf(\"" p "\", " p ")")
(tef "fmt.Errorf(\"" p "\", " p ")")
(ttf "func Test" (p "Name") "(t *testing.T) {" n
    "	tests := []struct {" n
    "		name string" n
    "		" p n
    "	}{" n
    "		{" n
    "			name: \"\"," n
    "		}," n
    "	}" n
    "	for _, tt := range tests {" n
    "		t.Run(tt.name, func(t *testing.T) {" n
    "			" n
    "		})" n
    "	}" n
    "}" n
    )
