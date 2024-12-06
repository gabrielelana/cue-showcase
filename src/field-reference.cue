count: {
    // useless but cool
    min!: uint & <=count.max
    max!: uint & >=count.min
}

// try to break the mutual constraint
// try to remove a field
// try to add a field
count: min: 1
count: max: 5
