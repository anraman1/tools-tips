// hello world
package main

import "fmt"

var monday = "Monday"
var Tuesday = "Tuesday"
var Wednesday = "Wednesday"
var days = []string{monday, Tuesday, Wednesday}

func main() {
	fmt.Println("Hello, World!")
	fmt.Println("Today is", days[0])
	pday()
}

// for loop to print days of the week

func pday() {
	for index, days := range days {
		fmt.Println(index+1, days)
	}

}
