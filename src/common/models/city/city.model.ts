import { Field, Int, ObjectType } from '@nestjs/graphql';
import { CountryModel } from '../country/country.model';

@ObjectType()
export class CityModel {
  @Field(() => Int)
  id!: number;

  @Field(() => String)
  title!: string;

  @Field(() => CountryModel)
  country!: CountryModel;

  @Field(() => Int)
  countryId!: number;
}
