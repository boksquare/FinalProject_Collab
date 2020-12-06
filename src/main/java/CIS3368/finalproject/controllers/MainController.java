package CIS3368.finalproject.controllers;

import CIS3368.finalproject.models.Covid;
import CIS3368.finalproject.models.CovidRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class MainController {

    @Autowired
    CovidRepository covidRepository;

    @RequestMapping("/")
    public ModelAndView Login(){
        ModelAndView mv = new ModelAndView("index");
        mv.addObject("covidapi", covidRepository.findAll());

        return mv;
    }

    @RequestMapping( value = "/graph", method = RequestMethod.GET)
    public ModelAndView view(){
        ModelAndView mv = new ModelAndView("graph");

        ChartDataController chartDataObject = new ChartDataController();
        mv.addObject("covidapi",covidRepository.findAll());

        return mv;
    }

    @RequestMapping(value = "/get", method = RequestMethod.GET)
    public ModelAndView get(@RequestParam("name") String name) {
        ModelAndView mv = new ModelAndView("redirect:/");
        String coviddata = getCovidByRegion(name);
        try {
            JSONObject json = new JSONObject(coviddata);
            mv.addObject("name", json.getJSONObject("data").getJSONObject("regions").getJSONObject(name).get("name").toString());
            mv.addObject("total_cases", json.getJSONObject("data").getJSONObject("regions").getJSONObject(name).get("total_cases").toString());
            mv.addObject("new_cases", json.getJSONObject("data").getJSONObject("regions").getJSONObject(name).getJSONObject("change").get("total_cases").toString());
            mv.addObject("deaths", json.getJSONObject("data").getJSONObject("regions").getJSONObject(name).get("deaths").toString());
            mv.addObject("recovered", json.getJSONObject("data").getJSONObject("regions").getJSONObject(name).get("recovered").toString());


        } catch (Exception e) {
            System.out.println(e.toString());

        }
        mv.addObject("covidapi",covidRepository.findAll());
        return mv;
    }

    private String getCovidByRegion(String name) {
        try {
            URL urlForGetRequest = new URL("https://api.quarantine.country/api/v1/summary/latest");

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
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public ModelAndView save(@RequestParam("id") String id, @RequestParam("name") String name, @RequestParam("date") String date, @RequestParam("total_cases") String total_cases, @RequestParam("new_cases") String new_cases, @RequestParam("deaths") String deaths, @RequestParam("recovered") String recovered){
        ModelAndView mv = new ModelAndView(("redirect:/"));
        Covid saveCovid;
        if (!id.isEmpty())
        {
            Optional<Covid> users = covidRepository.findById(id);
            saveCovid = users.get();
        }
        else{
            saveCovid = new Covid();
            saveCovid.setId(UUID.randomUUID().toString());

            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            String formatted = df.format(new Date());

            saveCovid.setDate(formatted);

        }
        saveCovid.setName(name);
        saveCovid.setTotal_cases(total_cases);
        saveCovid.setNew_cases(new_cases);
        saveCovid.setDeaths(deaths);
        saveCovid.setRecovered(recovered);
        covidRepository.save(saveCovid);
        mv.addObject("covidlist", covidRepository.findAll());
        return mv;
    }


}