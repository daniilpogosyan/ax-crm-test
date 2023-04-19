import { Field, Float, Int, ObjectType, registerEnumType } from '@nestjs/graphql';
import { ItemType } from '@prisma/client';
import { CityModel, ColorModel, CountryModel, LanguageModel, NationalityModel } from '../';

enum LeadType {
  Offplan,
  Secondary,
}

registerEnumType(LeadType, {
  name: 'LeadType',
});

@ObjectType()
export class LeadModel {
  @Field(() => Int)
  id!: number;

  @Field(() => ItemType)
  itemType: ItemType;

  @Field(() => String, { nullable: true })
  displayName: string;

  @Field(() => String, { nullable: true })
  firstName?: string;

  @Field(() => String, { nullable: true })
  lastName?: string;

  @Field(() => Date, { nullable: true })
  birthDate?: Date;

  @Field(() => Int, { nullable: true })
  quality: number;

  @Field(() => Float, { nullable: true })
  budget: number;

  @Field(() => String, { nullable: true })
  sourceDetails: string;

  // @Field(() => PropertyTypeModel, { nullable: true })
  // propertyType: PropertyTypeModel;

  // @Field(() => FileModel, { nullable: true })
  // avatar: FileMode;

  @Field(() => ColorModel)
  color: ColorModel;

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

  @Field(() => Date, { nullable: true })
  createdAt: Date;

  @Field(() => Date, { nullable: true })
  updatedAt: Date;
}

@ObjectType()
export class GeneralInfo {
  @Field(() => LeadType)
  leadType: LeadType;

  @Field(() => Int)
  id: number;

  @Field()
  country: string;

  @Field()
  city: string;

  @Field()
  language: string;

  @Field()
  nationality: string;

  @Field()
  birthday: Date;

  @Field()
  propertyType: string;
}
