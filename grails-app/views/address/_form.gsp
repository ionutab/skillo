<%@ page import="skillo.Address" %>



			<div class="control-group fieldcontain ${hasErrors(bean: addressInstance, field: 'details', 'error')} required">
				<label for="details" class="control-label"><g:message code="address.details.label" default="Details" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="details" required="" value="${addressInstance?.details}"/>
					<span class="help-inline">${hasErrors(bean: addressInstance, field: 'details', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: addressInstance, field: 'active', 'error')} ">
				<label for="active" class="control-label"><g:message code="address.active.label" default="Active" /></label>
				<div class="controls">
					<g:checkBox name="active" value="${addressInstance?.active}" />
					<span class="help-inline">${hasErrors(bean: addressInstance, field: 'active', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: addressInstance, field: 'postCode', 'error')} required">
				<label for="postCode" class="control-label"><g:message code="address.postCode.label" default="Post Code" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="postCode" name="postCode.id" from="${skillo.PostCode.list()}" optionKey="id" required="" value="${addressInstance?.postCode?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: addressInstance, field: 'postCode', 'error')}</span>
				</div>
			</div>
