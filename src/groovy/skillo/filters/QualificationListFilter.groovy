package skillo.filters

/**
 * Created by Andrei-Home on 7/17/2014.
 */
class QualificationListFilter extends BasicPaginatedSearchFilter {

    String name

    String getName() {
        return name
    }

    void setName(String name) {
        this.name = name
    }
}
