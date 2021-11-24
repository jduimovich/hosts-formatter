 

    // Importing the Required Modules
    const fs = require('fs');
    const readline = require('readline');

    var hostsFile = "C:/Windows/System32/drivers/etc/hosts";
    // Creating a readable stream from file
    // readline module reads line by line 
    // but from a readable stream only.
    const file = readline.createInterface({
        input: fs.createReadStream(hostsFile),
        output: process.stdout,
        terminal: false
    });

    // Printing the content of file line by
    //  line to console by listening on the
    // line event which will triggered
    // whenever a new line is read from
    // the stream
    // file.on('line', (line) => {
    //     console.log(line); 
    // });
    file.on('line', (line) => { 
        var split = line.split (" ").filter (x => x.length > 0);
        if (split.length > 0) { 
            var ip = split[0].trim();
            for (var i=1;i<split.length;i++) { 
                console.log (ip,  split[i].trim())
            }
        }
    }); 