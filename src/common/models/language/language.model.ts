import { Field, Int, ObjectType } from '@nestjs/graphql';
import { CountryModel } from '../country/country.model';

@ObjectType()
export class LanguageModel {
  @Field(() => Int)
  id!: number;

  @Field(() => String)
  title!: string;

  @Field(() => String)
  shortCode!: string;

  @Field(() => [CountryModel], { nullable: true })
  countries?: Array<CountryModel>;
}
