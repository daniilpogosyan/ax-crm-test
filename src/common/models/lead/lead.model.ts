import { PersonModel } from '@common/models/person/person.model';
import {
  Field,
  Float,
  Int,
  ObjectType,
  registerEnumType,
} from '@nestjs/graphql';
import { CityModel, CountryModel, LanguageModel, NationalityModel } from '../';

enum LeadType {
  Offplan,
  Secondary,
}

registerEnumType(LeadType, {
  name: 'LeadType',
});

@ObjectType()
export class LeadStatusModel {
  @Field(() => Int)
  id!: number;

  @Field(() => String)
  title!: string;

  @Field(() => String)
  color!: string;

  @Field(() => String)
  backgroundColor!: string;

  @Field(() => Int)
  step!: number;

  @Field(() => Int)
  stepsCount!: number;

  @Field(() => Date)
  createdAt!: Date;

  @Field(() => Date)
  updatedAt!: Date;
}

@ObjectType()
export class LeadModel {
  @Field(() => Int)
  id!: number;

  @Field(() => PersonModel)
  person: PersonModel;

  @Field(() => Float, { nullable: true })
  budget: number;

  // @Field(() => String, { nullable: true })
  // sourceDetails: string;

  // @Field(() => PropertyTypeModel, { nullable: true })
  // propertyType: PropertyTypeModel;

  // @Field(() => FileModel, { nullable: true })
  // avatar: FileMode;

  @Field(() => CityModel, { nullable: true })
  city: CityModel;

  @Field(() => CountryModel, { nullable: true })
  country: CountryModel;

  @Field(() => [LanguageModel], { nullable: true })
  languages: LanguageModel[];

  @Field(() => NationalityModel, { nullable: true })
  nationality: NationalityModel;

  // @Field(() => LeadIntentionModel, { nullable: true })
  // intention: LeadIntentionModel;

  // @Field(() => ChannelSourceModel, { nullable: true })
  // channelSource: ChannelSourceModel;

  // @Field(() => [AdTagModel], { nullable: true })
  // adTags: AdTagModel[];

  @Field(() => LeadStatusModel, { nullable: true })
  status: LeadStatusModel;

  @Field(() => Date, { nullable: true })
  createdAt: Date;

  @Field(() => Date, { nullable: true })
  updatedAt: Date;
}
