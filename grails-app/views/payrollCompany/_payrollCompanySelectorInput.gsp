%{--payroll.payrollCompany.id--}%
%{--payrollCompanyId--}%
%{--candidateInstance?.payroll?.payrollCompany?.id--}%

<g:hiddenField
        name="${attributeName}"
        id="${attributeId}"
        value="${payrollCompany?.id}"
/>

<g:javascript>
        function formatPayrollCompanies(item) { return item.name; };
        $("#payrollCompanyId").select2({
                data: {results:${availablePayrollCompanies}, text:'name'},
                formatSelection: formatPayrollCompanies,
                formatResult: formatPayrollCompanies,
                placeholder: "Select a Payroll Company",
                allowClear:true
            }
        );
</g:javascript>