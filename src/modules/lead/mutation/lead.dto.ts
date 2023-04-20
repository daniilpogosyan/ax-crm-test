import { ResolverParams } from '@common/models/params';
import {
  ArgsType,
  Field,
  Float,
  InputType,
  Int,
  OmitType,
  PartialType,
} from '@nestjs/graphql';

@InputType()
export class CreateLeadInput {
  @Field(() => String)
  firstName?: string;

  @Field(() => String, { nullable: true })
  lastName?: string;

  @Field(() => String, { nullable: true })
  secondName?: string;

  @Field(() => Date, { nullable: true })
  birthDate?: Date | string;

  @Field(() => Float, { nullable: true })
  budget?: number;

  @Field(() => Int, { nullable: true })
  nationalityId?: number;

  @Field(() => Int, { nullable: true })
  countryId?: number;

  @Field(() => Int, { nullable: true })
  cityId?: number;

  // @Field(() => Int, { nullable: true })
  // leadSourceId?: number;

  // @Field(() => Int)
  // intentionId?: number;

  // @Field(() => Int, { nullable: true })
  // areaSizeId?: number;

  // @Field(() => Int, { nullable: true })
  // bedroomsId?: number;

  // @Field(() => Int, { nullable: true })
  // propertyTypeId?: number;

  @Field(() => [Int])
  languageIds?: number[];

  // @Field(() => [Int], { nullable: true })
  // communityIds?: number[];

  // @Field(() => [Int], { nullable: true })
  // projectIds?: number[];
}

@ArgsType()
export class CreateLeadArgs extends ResolverParams(CreateLeadInput) {}

@InputType()
export class UpdateLeadInput extends PartialType(CreateLeadInput) {
  @Field(() => Int)
  leadId: number;

  @Field(() => Int, { nullable: true })
  statusId?: number;

  @Field(() => String, { nullable: true })
  statusReason?: string;

  @Field(() => Int, { nullable: true })
  responsibleAgentId?: number;
}

@ArgsType()
export class UpdateLeadArgs extends ResolverParams(UpdateLeadInput) {}
