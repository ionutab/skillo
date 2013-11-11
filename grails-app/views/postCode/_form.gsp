<%@ page import="skillo.PostCode" %>



			<div class="control-group fieldcontain ${hasErrors(bean: postCodeInstance, field: 'code', 'error')} required">
				<label for="code" class="control-label"><g:message code="postCode.code.label" default="Code" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="code" required="" value="${postCodeInstance?.code}"/>
					<span class="help-inline">${hasErrors(bean: postCodeInstance, field: 'code', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: postCodeInstance, field: 'latitude', 'error')} ">
				<label for="latitude" class="control-label"><g:message code="postCode.latitude.label" default="Latitude" /></label>
				<div class="controls">
					<g:field type="number" name="latitude" step="any" value="${postCodeInstance.latitude}"/>
					<span class="help-inline">${hasErrors(bean: postCodeInstance, field: 'latitude', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: postCodeInstance, field: 'longitude', 'error')} ">
				<label for="longitude" class="control-label"><g:message code="postCode.longitude.label" default="Longitude" /></label>
				<div class="controls">
					<g:field type="number" name="longitude" step="any" value="${postCodeInstance.longitude}"/>
					<span class="help-inline">${hasErrors(bean: postCodeInstance, field: 'longitude', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: postCodeInstance, field: 'easting', 'error')} ">
				<label for="easting" class="control-label"><g:message code="postCode.easting.label" default="Easting" /></label>
				<div class="controls">
					<g:field type="number" name="easting" value="${postCodeInstance.easting}"/>
					<span class="help-inline">${hasErrors(bean: postCodeInstance, field: 'easting', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: postCodeInstance, field: 'northing', 'error')} ">
				<label for="northing" class="control-label"><g:message code="postCode.northing.label" default="Northing" /></label>
				<div class="controls">
					<g:field type="number" name="northing" value="${postCodeInstance.northing}"/>
					<span class="help-inline">${hasErrors(bean: postCodeInstance, field: 'northing', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: postCodeInstance, field: 'grindRef', 'error')} ">
				<label for="grindRef" class="control-label"><g:message code="postCode.grindRef.label" default="Grind Ref" /></label>
				<div class="controls">
					<g:textField name="grindRef" value="${postCodeInstance?.grindRef}"/>
					<span class="help-inline">${hasErrors(bean: postCodeInstance, field: 'grindRef', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: postCodeInstance, field: 'district', 'error')} ">
				<label for="district" class="control-label"><g:message code="postCode.district.label" default="District" /></label>
				<div class="controls">
					<g:textField name="district" value="${postCodeInstance?.district}"/>
					<span class="help-inline">${hasErrors(bean: postCodeInstance, field: 'district', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: postCodeInstance, field: 'ward', 'error')} ">
				<label for="ward" class="control-label"><g:message code="postCode.ward.label" default="Ward" /></label>
				<div class="controls">
					<g:textField name="ward" value="${postCodeInstance?.ward}"/>
					<span class="help-inline">${hasErrors(bean: postCodeInstance, field: 'ward', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: postCodeInstance, field: 'districtCode', 'error')} ">
				<label for="districtCode" class="control-label"><g:message code="postCode.districtCode.label" default="District Code" /></label>
				<div class="controls">
					<g:textField name="districtCode" value="${postCodeInstance?.districtCode}"/>
					<span class="help-inline">${hasErrors(bean: postCodeInstance, field: 'districtCode', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: postCodeInstance, field: 'wardCode', 'error')} ">
				<label for="wardCode" class="control-label"><g:message code="postCode.wardCode.label" default="Ward Code" /></label>
				<div class="controls">
					<g:textField name="wardCode" value="${postCodeInstance?.wardCode}"/>
					<span class="help-inline">${hasErrors(bean: postCodeInstance, field: 'wardCode', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: postCodeInstance, field: 'county', 'error')} ">
				<label for="county" class="control-label"><g:message code="postCode.county.label" default="County" /></label>
				<div class="controls">
					<g:textField name="county" value="${postCodeInstance?.county}"/>
					<span class="help-inline">${hasErrors(bean: postCodeInstance, field: 'county', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: postCodeInstance, field: 'country', 'error')} ">
				<label for="country" class="control-label"><g:message code="postCode.country.label" default="Country" /></label>
				<div class="controls">
					<g:textField name="country" value="${postCodeInstance?.country}"/>
					<span class="help-inline">${hasErrors(bean: postCodeInstance, field: 'country', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: postCodeInstance, field: 'countryCode', 'error')} ">
				<label for="countryCode" class="control-label"><g:message code="postCode.countryCode.label" default="Country Code" /></label>
				<div class="controls">
					<g:textField name="countryCode" value="${postCodeInstance?.countryCode}"/>
					<span class="help-inline">${hasErrors(bean: postCodeInstance, field: 'countryCode', 'error')}</span>
				</div>
			</div>


