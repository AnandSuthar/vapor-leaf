import Vapor

let drop = Droplet()

drop.get("name") { request in
    
    guard let name = request.data["name"]?.string else {
        throw Abort.badRequest
    }
    
    let node = try Node(node:[
        "name": name
        ])
    
    return try drop.view.make("showName", node)
    
}

drop.get("array") { request in
    
    guard let names = request.data["names"]?.string else {
        throw Abort.badRequest
    }
    
    let node = try Node(node:[
        "names": names.components(separatedBy: ",").makeNode()
        ])
    
    return try drop.view.make("nameArray", node)
    
}

drop.get("arrayNode") { request in
    
    let users = try [
        ["name": "anand", "age": "25"].makeNode(),
        ["name": "aman", "age": "26"].makeNode()
    ].makeNode()
    
    let node = try Node(node:[
        "users": users
        ])
    
    return try drop.view.make("arrayNode", node)
    
}

drop.get("bool") { request in
    
    guard let boolValue = request.data["onoff"]?.string else {
        throw Abort.badRequest
    }
    
    let node = try Node(node:[
        "onoff": boolValue
        ])
    
    return try drop.view.make("bool", node)
    
}

drop.run()




































