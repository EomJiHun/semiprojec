// Google chart를 이용한 차트
google.charts.load('current', {packages: ['corechart', 'line']});
google.charts.setOnLoadCallback(drawLineColors);

function drawLineColors() {
      var data = google.visualization.arrayToDataTable([
          ['Month', '매출액(단위:만)', '방문자수'],
          ['1',  500,      400],
          ['2',  590,      460],
          ['3',  600,       1120],
          ['4',  190,      540],
          ['5',  1030,      420],
          ['6',  500,      902],
          ['7',  382,      540],
          ['8',  200,      10],
          ['9',  0,      0],
          ['10',  0,      0],
          ['11',  0,      0],
          ['12',  0,      0]
        ]);

      var options = {
              title: '2019년 매출액 및 방문자수 추이',
              curveType: 'function',
              legend: { position: 'bottom' },
              titleTextStyle: {
      			color: '#333333',    // any HTML string color ('red', '#cc00cc')
      			fontName: 'Times New Roman', // i.e. 'Times New Roman'
      			fontSize: 18, // 12, 18 whatever you want (don't specify px)
      			bold: true,    // true or false
      			italic: false   // true of false
      			}
            };

      var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
      chart.draw(data, options);
}


$(document).ready(function(){
	
	// 메뉴 리스트 페이지 전환
	$('.list-group .list').click(function(){
		$.ajax({
			type:'POST',
			dataType:'json',
			contentType:'application/json',
			url:$(this).attr("href"),
			success:function(object){
				console.log(object);
				$('.main').load(object.url);
			}
		})
		return false;
	});
	
});