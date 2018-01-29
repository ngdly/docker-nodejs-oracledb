var oracledb = require('oracledb');
oracledb.getConnection({
    user: 'user',
    password: 'password',
    connectString: '10.10.50.60:1521/dbname'
},
function(err, connection) {
    if (err) {
        console.error(err.message);
        return;
    }
    console.log("ok");
    connection.execute(
        "Select * from table", [], // bind value for :id
        function(err, result) {
            if (err) {
                console.error(err.message);
                return;
            }
            console.log("select ok");
            for (var i = 0; i < result.rows.length; i++) {
                console.log(result.rows[i][0] + " | " + result.rows[i][1] + " | " + result.rows[i][2]);
            }
        });
});