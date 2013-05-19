$(document).ready(function() {
  $(".unit-toggle").click(function(e){
    var id = $(this).attr("data-building");
    var unit = $(this).attr("data-unit");
    $.getJSON("/building/"+id+".json", function(data){
      var metricStats = data.stats.map(function(val){
        if(unit === 'meters'){
          $("."+val.item).html(val.heading+(val.number*0.3048)+" m");
          $(".unit-toggle").html("Switch to Standard");
          $(".unit-toggle").attr("data-unit", "feet");
        }else{
          $("."+val.item).html(val.heading+val.number+" ft");
          $(".unit-toggle").html("Switch to Metric");
          $(".unit-toggle").attr("data-unit", "meters");
        }
      });
    });
    e.preventDefault();
  });
});


