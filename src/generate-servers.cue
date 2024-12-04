#DB: "postgresql" | =~"db$"
#CheckPostgreSQL: close({for k, v in services {"\(k)": true}}) & {"postgresql": true}

services: {
        nginx: _
        blizard: _
        "otel-collector": command: "exec otel"
        boltdb: replicas: 3
        postgresql: replicas: 5
}

services: [Name=_]: {
        name:     Name
        command:  string | *"exec \(Name)"
        replicas: uint | *1
}

services: [#DB]: replicas: >=3
