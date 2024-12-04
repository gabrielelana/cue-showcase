#Schema: #TypeName | #Union | #Record | #Enum | #Array

#Name: =~#"^([A-Za-z_][A-Za-z0-9_]*)(\.([A-Za-z_][A-Za-z0-9_]*))*$"#

#TypeName: #PrimitiveType | #DefinedType
#TypeName: #Name

#PrimitiveType: "null" | "boolean" | "int" | "long" | "float" | "double" | "bytes" | "string"

#DefinedType: string

#Union: [... #Schema]

#Definition: {
    type!: string
    name!: #DefinedType
    namespace?: =~#"^([A-Za-z_][A-Za-z0-9_]*)(\.([A-Za-z_][A-Za-z0-9_]*))*"#
    aliases?: [...string]
    doc?: string
    ...
}

#Record: #Definition & {
    type!: "record"
    doc?: string
    fields!: [... #Field]
}

#Enum: #Definition & {
    type!: "enum"
    name!: string
    symbols!: [... #Name]
    default?: #Name
    if !list.Contains(symbols, default) {
        default?: _|_
    }
}

#Array: {
    type!: "array"
    items!: #Schema
    default!: []
}

// ...
