var fs = require('fs') 

var routes=process.argv[2]; 
if (routes == undefined) { 
    console.log('No routes.json found exit');
    return
}

console.log ("Routes file ", routes) 
fs.readFile('./routes.json', function(err, data) {
   
    if (err) {
        console.log('No routes.json found ('+err+'). Using default routes');
    } else {
        try {
            var routes = JSON.parse(data.toString('utf8',0,data.length));
            for (var i =0;i< routes.items.length;i++)
        {
            console.log ("admin-helper.exe add 127.0.0.1 ", routes.items[i].spec.host)
        }
        } catch (e) {
            console.log('Error parsing routes.json: '+e);
            process.exit(1);
        }
    } 
});