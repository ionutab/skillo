import skillo.tenant.CachingTenantRepository
import skillo.tenant.DomainTenantResolver

// Place your Spring DSL code here
beans = {
	customPropertyEditorRegistrar(CustomDateEditorRegistrar)
    tenantResolver(DomainTenantResolver)
    tenantRepository(CachingTenantRepository)

}

