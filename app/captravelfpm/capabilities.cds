using TravelService as service from '../../srv/service';

annotate service.Travel with @(
    Capabilities.FilterRestrictions: {
        FilterExpressionRestrictions : [
            {
                $Type : 'Capabilities.FilterExpressionRestrictionType',
                AllowedExpressions: 'SingleValue',
                Property: 'BeginDate'
            },
            {
                $Type : 'Capabilities.FilterExpressionRestrictionType',
                AllowedExpressions: 'SingleValue',
                Property: 'EndDate'
            },
        ],
    }
);