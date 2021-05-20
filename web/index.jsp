
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Holiday Travel Weather</title>
  </head>
  <body>
  <p> Select Country to see a list of public holidays</p>

  <select id = "Country" onchange = "selectArea()">
      <option selected> --select country--</option>
      <option>CN</option>
      <option>UK</option>
      <option>US</option>

  </select>
  <div id ="holiday"><p>This is your selected country public holidays</p></div>

  <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>


  <div id = "holidayData"></div>
  <button type="button" onclick="loadHoliday()">Load Holiday</button>

  <script>
    var country = document.getElementById("Country");
    //the value of selected
    //country.options[country.selectedIndex].value


    function loadHoliday() {
      var url1 ='https://calendarific.com/api/v2/holidays?api_key=9ff75999cf629a635cf44eb754fd27c266f2e11d&country='+country.options[country.selectedIndex].value+'&year=2019';
      $.get(url1, function (data) {

        data = JSON.stringify(data);
        data = data.substring(34);


        //it can only display all the country holiday but can not divided the public holiday
        document.getElementById('holidayData').innerText = data.replaceAll("[","\r\n");
      });
    };


  </script>


  <p>Select the area residing </p>

  <script>
    function selectArea(){
      var area = [['--select area--'],
      ['Beijing','Suzhou'],
      ['Liverpool','London'],
        ['New York','Los Angeles']]

      var selectNode = document.getElementById("Country");
      var subSelectNode = document.getElementById("area");

      var index = selectNode.selectedIndex;

      var areas = area[index];

      for(var i =0; i<subSelectNode.options.length;i++){
        subSelectNode.removeChild(subSelectNode.options[i]);
        i--;
      }

      for(var i = 0; i <areas.length;i++){
        var optionNode = document.createElement("option");
        optionNode.innerHTML=areas[i];
        subSelectNode.appendChild(optionNode);
      }
    }

  </script>


  <select id = "area">
    <option selected> --select area--</option>
    <option>CN</option>
    <option>UK</option>
    <option>US</option>

  </select>


  <div id = "weather"><p>The weather information for the selected public holiday in area</p></div>


  <div id = "weatherData"></div>
  <button type="button" onclick="loadWeather()">Load Weather </button>

  <script>

    function loadWeather() {
      var url1 ='https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/China?unitGroup=us&key=T8GVTREXLXREFJTNULKGDX3CX';
      $.get(url1, function (data) {

        data = JSON.stringify(data);


        //do not obtain the holidays information for get the API to selected the day weather information
        document.getElementById('weatherData').innerText = data.replaceAll("[","\r\n");
      });
    };

  </script>

  <div id="accommodation"><p>The available short-term accommodation rental information for the selected</p></div>


  <div id = "accommodationData"></div>
  <button type="button" onclick="loadAccommodation()">Load accommodation </button>

  <script>

    function loadAccommodation() {


      const settings = {
        "async": true,
        "crossDomain": true,
        "url": "https://hotels4.p.rapidapi.com/locations/search?query=new%20york&locale=en_US",
        "method": "GET",
        "headers": {
          "x-rapidapi-key": "491c4bff7emsh8d9a811d788ca8ap1ecc19jsnbc179d2d974e",
          "x-rapidapi-host": "hotels4.p.rapidapi.com"
        }
      };

      $.ajax(settings).done(function (response) {
        document.getElementById('accommodationData').innerText = response;
      });

    };

  </script>



  </body>
</html>
