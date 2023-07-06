function processData(input) {
    var s = input.split('\n');
    var n=parseInt(s[0]);
    var namesList = s.slice(1,n+1);
    namesList.sort()
    var q = parseInt(s[n+1]);
    var queries = s.slice(n+2);
    var alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    for (let i = 0; i < q; i++) {
		var name = queries[i];
        var position = namesList.indexOf(name)+1;
        var score = 0;
        for (let j =0 ; j < name.length; j++){
            var score = score + alphabet.indexOf(name[j])+1;
        }
        var ans = score * position;
        process.stdout.write(ans.toString()+'\n');
    }
}

process.stdin.resume();
process.stdin.setEncoding("ascii");
_input = "";
process.stdin.on("data", function (input) {
    _input += input;
});

process.stdin.on("end", function () {
   processData(_input);
});
