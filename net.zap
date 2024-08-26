opt server_output = "src/server/ZapServer.luau"
opt client_output = "src/client/ZapClient.luau"
opt casing = "camelCase"

event Booleans = {
    from: Client,
    type: Reliable,
    call: SingleAsync,
    data: boolean[1000],
}

event StructOfNumbers = {
    from: Client,
    type: Reliable,
    call: SingleAsync,
    data: struct {
        id: u16,
        x: i8,
        y: i16,
        z: i8,
        orientation: i16,
        animation: u8,
    }[100]
}
