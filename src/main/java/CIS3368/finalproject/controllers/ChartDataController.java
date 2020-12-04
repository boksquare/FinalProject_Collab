package CIS3368.finalproject.controllers;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ChartDataController {

    static Map<Object,Object> map = null;
    static List<List<Map<Object,Object>>> list = new ArrayList<List<Map<Object,Object>>>();
    static List<Map<Object,Object>> dataPoints1 = new ArrayList<Map<Object,Object>>();

    static {

        //make REST API calls here to gather data, parse data into properties, e.g.:

        double usaCases = 11800000.0;
        double brazilCases = 5980000.0;
        double germanyCases = 867000.0;
        double swedenCases = 210000.0;
        double canadaCases = 316000.0;
        double southKoreaCases = 29654.0;

        map = new HashMap<Object,Object>(); map.put("label", "USA"); map.put("y", usaCases);dataPoints1.add(map);
        map = new HashMap<Object,Object>(); map.put("label", "BRAZIL"); map.put("y", brazilCases);dataPoints1.add(map);
        map = new HashMap<Object,Object>(); map.put("label", "GERMANY"); map.put("y", germanyCases);dataPoints1.add(map);
        map = new HashMap<Object,Object>(); map.put("label", "SWEDEN"); map.put("y", swedenCases);dataPoints1.add(map);
        map = new HashMap<Object,Object>(); map.put("label", "CANADA"); map.put("y", canadaCases);dataPoints1.add(map);
        map = new HashMap<Object,Object>(); map.put("label", "SOUTH KOREA"); map.put("y", southKoreaCases);dataPoints1.add(map);

        list.add(dataPoints1);


    }

    public static List<List<Map<Object, Object>>> getChartList() {
        return list;
    }
}