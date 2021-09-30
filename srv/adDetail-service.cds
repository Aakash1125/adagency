using adagency as Ad from '../db/data-model';

service AdDetailService {
    
    entity AdDetails as projection on Ad.AdDetails{
        *, category.name as categoryName
    };
    entity Category  as projection on Ad.Category;

}
