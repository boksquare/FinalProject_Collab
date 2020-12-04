package CIS3368.finalproject.controllers;

import com.mashape.unirest.http.HttpResponse;
import com.mashape.unirest.http.Unirest;
import org.json.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;
import java.util.Map;

@Controller
public class MainController {

    @RequestMapping( value = "/graph", method = RequestMethod.GET)
    public ModelAndView view(){
        ModelAndView mv = new ModelAndView("graph");

        ChartDataController chartDataObject = new ChartDataController();
        List<List<Map<Object, Object>>> chartDataList = chartDataObject.getChartList();
        mv.addObject("dataPointsList", chartDataList);

        return mv;
    }

    @RequestMapping(value = "/get", method = RequestMethod.GET)
    public ModelAndView get(@RequestParam("name") String name) {
        ModelAndView mv = new ModelAndView("redirect:/");
        String coviddata = getCovidByRegion(name);
        try {
            JSONObject json = new JSONObject(coviddata);
            mv.addObject("total_cases", json.getJSONObject("data").getJSONObject("summary").get("total_cases").toString());
            mv.addObject("Total Deaths", json.getJSONObject("data").getJSONObject("summary").get("active_cases").toString());
            mv.addObject("Total_cases_today", json.getJSONObject("data").getJSONObject("change").get("total_cases").toString());

        } catch (Exception e) {
            System.out.println(e.toString());

        }
        return mv;
    }

    private String getCovidByRegion(String name) {
        try {
            URL urlForGetRequest = new URL("https://api.quarantine.country/api/v1/summary/region?region="+name+"&sub_areas=0");

            HttpURLConnection connection = (HttpURLConnection) urlForGetRequest.openConnection();
            connection.setRequestMethod("GET");
            if (connection.getResponseCode() == HttpURLConnection.HTTP_OK) {
                BufferedReader in = new BufferedReader(
                        new InputStreamReader((connection.getInputStream())));
                StringBuilder response = new StringBuilder();
                String line;
                while ((line = in.readLine()) != null) {
                    response.append(line);
                }
                in.close();
                return response.toString();
            } else {
                return "Unexpected HTTP response";

            }

        } catch (Exception e) {
            return "Exception: " + e.getMessage();
        }


    }

}
