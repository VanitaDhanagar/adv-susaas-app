using { PublicService as ExtService } from './extension';
using { PublicService } from '../../../srv/annotations/public/layouts_Assessments';
 

annotate PublicService.Assessments with @(
    UI.FieldGroup #x_ProductInformation : {
        Data : [
            { Value : product.ID , Label: '{i18n>ID}' },
            { Value : product.text , Label: '{i18n>text}' },
            { Value : product.price , Label: '{i18n>price}' },
            { Value : product.category , Label: '{i18n>category}' },
            { Value : product.typeCode , Label: '{i18n>typeCode}' },
            { Value : product.weightMeasure, Label: '{i18n>weight}' }
        ]
    },
);

annotate PublicService.Assessments with @(
    UI.Facets : [ 
        ... up to {
            $Type : 'UI.CollectionFacet',
            ID     : 'collectionFacetSectionGeneral',
        },
        {
            $Type  : 'UI.CollectionFacet',
            ID     : 'collectionFacetSectionProduct', 
            Label  : '{i18n>productInformation}',
            Facets : [{
                $Type  : 'UI.ReferenceFacet',
                Label  : '{i18n>productInformation}',
                Target : '@UI.FieldGroup#x_ProductInformation'
            }]
        },
        ...
    ]
);
