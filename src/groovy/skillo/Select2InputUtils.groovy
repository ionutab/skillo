package skillo

/**
 * Created by ionutab on 10/7/2014.
 */
class Select2InputUtils {

    def static Collection<Collection<Long>> splitSelect2MultipleInputArray(ArrayList<String> inputArray) {

        Collection<Collection<Long>> ret = new ArrayList<ArrayList<Long>>()
        for (String unexploded : inputArray) {
            if (unexploded.trim().length() > 0) {
                ArrayList<String> valS = Arrays.asList(unexploded.split(","))
                ArrayList<Long> val = new ArrayList<Long>()

                for (String id : valS) {
                    String[] valSId = id.split(":")
                    val.add(Long.parseLong(valSId[0]))
                }

                ret.add(val)
            }
        }

        return ret
    }

    def static Collection<HashMap<Long, String>> splitSelect2MultipleArrayToHashMap(ArrayList<String> inputArray) {
        Collection<HashMap<Long, String>> ret = new ArrayList<ArrayList<Long>>()

        for (String unexploded : inputArray) {
            if (unexploded.trim().length() > 0) {
                ArrayList<String> valUnsplit = Arrays.asList(unexploded.split(","))
                HashMap<Long, String> vals = new HashMap<Integer, String>()

                for (String section : valUnsplit) {
                    String[] sectionSplit = section.split(":")
                    if (sectionSplit.length > 1) {
                        if (sectionSplit[0].matches("\\d+")) {
                            vals.put(Long.parseLong(sectionSplit[0]), sectionSplit[1])
                        }
                    }
                }
                ret.add(vals)
            }
        }

        return ret
    }

    def static Collection<Collection<Long>> getIdsFromHashMapArray(ArrayList<HashMap<Long, String>> inputMap) {
        Collection<Collection<Long>> ret

        if (inputMap.size() > 0) {
            ret = new ArrayList<ArrayList<Long>>()
        } else {
            return null
        }
        for (HashMap<Long, String> map : inputMap) {
            ret.add(map.keySet())
        }

        return ret
    }
}
