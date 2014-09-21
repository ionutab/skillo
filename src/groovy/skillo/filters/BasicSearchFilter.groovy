package skillo.filters

/**
 * Created by ionutab on 9/13/2014.
 */
abstract class BasicSearchFilter implements Serializable {

    private String sort

    private String order

    String getSort() {
        return sort
    }

    void setSort(String sort) {
        this.sort = sort
    }

    String getOrder() {
        return order
    }

    void setOrder(String order) {
        this.order = order
    }

}
