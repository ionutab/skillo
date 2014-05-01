package skillo

import groovy.sql.Sql

import javax.sql.DataSource

class InitService {

    static transactional = true

    def grailsApplication

    def dataSource

    void setDataSource(dataSource) {
        log.info("setting datasource value $dataSource")
        this.dataSource = dataSource
    }

    def serviceMethod() {

        log.debug("Current Post Codes " + PostCode.count())
        log.debug("Current Qualifications " + Qualification.count())

        if(PostCode.count() == 0 || Qualification.count() == 0){

            String sqlString = grailsApplication.mainContext.getResource('classpath:/resources/sql/queries.sql').inputStream.text
//            String sqlString = grailsApplication.mainContext.getResource('classpath:/resources/sql/test.sql').inputStream.text
            Sql sql = new Sql(dataSource)
            List<String> lines = sqlString.readLines()

            lines.each {
                sql.execute(it);
            }

        }

        log.info("Current Post Codes " + PostCode.count())
        log.info("Current Qualifications " + Qualification.count())

    }
}
