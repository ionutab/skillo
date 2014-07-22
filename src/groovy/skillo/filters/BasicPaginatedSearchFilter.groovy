package skillo.filters

abstract class BasicPaginatedSearchFilter implements Serializable {

    private Long max

    private Long offset

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

    private validatePaginator(){
        log.debug("BasicPaginatedSearchFilter.validatePaginator")
        this.max = Math.min(this.max ? this.max : 10, 100)
    }
}
