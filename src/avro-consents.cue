#ConsentFieldNames: ["consents", "given", "denied"]

#ConsentFields: {
    for _name in #ConsentFieldNames {
        "\(_name)": {
            name: "\(_name)_Consent"
            type: "record"
            fields: [
                {name: "name", type: "string"},
                {name: "owner", type: avro.#Enum & {
                    name: "\(_name)_Owner"
                    symbols: [
                        "UNKNOWN",
                        "MARKETING",
                        "BROADBAND",
                        "ENERGY",
                        "INSURANCE_MOTOR",
                        "INSURANCE_LIFE",
                        "INSURANCE_PROFESSIONAL",
                        "INSURANCE_PET",
                        "LONG_TERM_RENTAL",
                        "MORTGAGE",
                        "LOAN",
                        "PERSONAL_AREA",
                ],
                    default: "UNKNOWN"
                }},
                {name: "isMandatory", type: "boolean"},
                {name: "given", type: "boolean"},
                briks.#DateTime & {name: "updatedAt"},
        ]}
    }
}

#Identity: {
    name: "Identity"
    type: "record"
    fields: [
        {name: "email", type: "string"},
        {name: "facileUserId", type: ["null", "string"]},
    ]
}

avro.#Schema & {
    name: "Consents"
    fields: [
        {name: "identity", type: #Identity},
        briks.#DateTime & {name: "createdAt"},
        briks.#DateTime & {name: "updatedAt"},
        for _name in #ConsentFieldNames {
            {name: _name, type: {
                type: "array",
                items: #ConsentFields[_name],
                default: [],
            }}
        }
    ]
}
