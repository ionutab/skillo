package skillo.filters

abstract class BasicPaginatedSearchFilter implements Serializable {

    private Long max

    private Long offset

    private String sort

    private String order

    public BasicPaginatedSearchFilter(){
        log.debug("BasicPaginatedSearchFilter")
        validatePaginator()
    }

    public Long getMax() {
        return max
    }

    public void setMax(Long max) {
        this.max = max
    }

    public Long getOffset() {
        return offset
    }

    public void setOffset(Long offset) {
        this.offset = offset
    }

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

    private validatePaginator(){
        this.max = Math.min(this.max ? this.max : 10, 100)
    }

}
