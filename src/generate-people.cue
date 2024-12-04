#Person: {
    firstName!: string & =~"^[A-Z].*$"
    lastName!: string & =~"^[A-Z].*$"
    fullName: "\(firstName) \(lastName)"
    occupation!: string
    consultant: bool | *false
    if consultant == true {
        vat!: =~"^IT"
    }
}

people: [...#Person]

people: [{
    firstName: "Gabriele"
    lastName: "Lana"
    occupation: "software developer"
    consultant: true
    vat: "IT08937100967"
}, {
    firstName: "Mario"
    lastName: "Rossi"
    occupation: "baker"
}]
