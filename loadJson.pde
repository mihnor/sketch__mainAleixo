JSONArray poemas;

JSONObject poema1, poema2, poema3;
void initJson() {

  poemas = loadJSONArray("_json/versos_aleixo.json");

  poema1 = poemas.getJSONObject(0);
  poema2 = poemas.getJSONObject(1);
  poema3 = poemas.getJSONObject(2);
}

