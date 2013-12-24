package skillo

class SessionController {

    def ajaxToggleSidebar(){

        String narrowSidebarPropertyCode = "user.layout.sidebar.narrow";

        Boolean sidebarToggle = (Boolean)session.getAttribute(narrowSidebarPropertyCode)

        if(null == sidebarToggle){
            session.setAttribute(narrowSidebarPropertyCode,Boolean.TRUE)
        } else {
            if(Boolean.TRUE.equals(sidebarToggle)){
                session.setAttribute(narrowSidebarPropertyCode,Boolean.FALSE)
            } else {
                session.setAttribute(narrowSidebarPropertyCode,Boolean.TRUE)
            }
        }

    }

}
