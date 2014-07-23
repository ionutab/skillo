package skillo

import grails.transaction.Transactional
import org.grails.datastore.mapping.query.api.Criteria
import skillo.filters.ClientListFilter
import skillo.filters.QualificationSearchFilter

/**
 * Created by Andrei-Home on 7/18/2014.
 */
@Transactional
class QualificationService {

    def Collection<Qualification> search(QualificationSearchFilter filter) {

        Criteria cc = Qualification.createCriteria()

        def qualificantionList = cc.list(max: filter.max, offset: filter.offset) {

            if (filter.name) {
                ilike("name", new String("%$filter.name%"))
            }

        }

        return qualificantionList
    }
}