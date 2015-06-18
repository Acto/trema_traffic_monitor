var SCREEN_WIDTH = 500;
var SCREEN_HEIGHT = 300

$(function(){

    function initiDraw(){
        var $canvas;

         /* canvas要素のノードオブジェクト */
        $canvas = $('#canvassample')[0];
        /* canvas要素の存在チェックとCanvas未対応ブラウザの対処 */
        if ( ! $canvas || ! $canvas.getContext ) {
           return false;
        }

        /* 2Dコンテキスト */
        var $ctx = $canvas.getContext('2d');
        /* 四角形＿線（strokeStyleで線の色、strokeRect(x,y, width,height)で四角形） */
        $ctx.strokeStyle = 'rgb(0,191,255)';
        $ctx.strokeRect(35,50, 100, 100);
    }

    // ここに実際の処理を記述します。
    initiDraw();

    $.getJSON("traffic.json", function(data){
        for(var i in data){
            console.log(data[i].route_packets)
        }
    });

});
