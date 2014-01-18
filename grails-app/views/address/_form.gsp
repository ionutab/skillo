<%@ page import="skillo.Address" %>



			<div class="control-group fieldcontain ${hasErrors(bean: addressInstance, field: 'details', 'has-error')} required">
				<label for="details" class="control-label"><g:message code="address.details.label" default="Details" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="details" required="" value="${addressInstance?.details}"/>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: addressInstance, field: 'active', 'has-error')} ">
				<label for="active" class="control-label"><g:message code="address.active.label" default="Active" /></label>
				<div class="controls">
					<g:checkBox name="active" value="${addressInstance?.active}" />
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: addressInstance, field: 'postCode', 'has-error')} required">
				<label for="postCode" class="control-label"><g:message code="address.postCode.label" default="Post Code" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="postCode" name="postCode.id" from="${skillo.PostCode.list()}" optionKey="id" required="" value="${addressInstance?.postCode?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: addressInstance, field: 'postCode', 'has-error')}</span>
				</div>
			</div>
