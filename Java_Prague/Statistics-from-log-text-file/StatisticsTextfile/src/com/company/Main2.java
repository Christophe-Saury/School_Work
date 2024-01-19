package com.company;

import java.util.ArrayList;
import java.util.List;
import java.util.HashMap;
import java.io.*;
import java.util.Map;

public class Main2 {

    public static void main(String[] args) throws IOException {
        var start = System.currentTimeMillis();
        String line_str;
        HashMap<String, Integer> repetitions = new HashMap<String, Integer>();
        List<String> sorted_array = new ArrayList<String>();

        var is = Main.class.getResourceAsStream("/messages");
        BufferedReader reader = new BufferedReader(new InputStreamReader(is, "UTF-8"), 8192);

        for(int i=0; (line_str = reader.readLine()) != null; i++) {


            if ((line_str.charAt(21) == 's' && line_str.charAt(22) == 's') &&( (line_str.charAt(33) == 'A')||(line_str.charAt(34) == 'A'))) {
                var before = "from ";
                var indexStart = line_str.indexOf(before);
                var after = " port";
                var indexEnd = line_str.indexOf(after);
                var a = line_str.substring(indexStart + before.length(), indexEnd);
                //System.out.println(line_str);
                if (repetitions.containsKey(a)) {
                    repetitions.put(a, repetitions.get(a) + 1);
                } else {
                    repetitions.put(a, 1);
                }
            }

        }

        for (Map.Entry<String, Integer> e : repetitions.entrySet()) {
            String val_key = e.getValue() + " " + e.getKey();
            sorted_array.add(val_key);
        }

        sorted_array.sort((o1, o2) -> {
            var n1 = Integer.parseInt(o1.split(" ")[0]);
            var n2 = Integer.parseInt(o2.split(" ")[0]);

            return Integer.compare(n1, n2);
        });

        System.out.println("The following are the statistics of the number of times each ip address was connected successfully.");
        for(int j=0; sorted_array.size()>j; j++){
            System.out.println(sorted_array.get(j));
        }
        System.out.println("time main2: " + (System.currentTimeMillis() - start));
    }
}

