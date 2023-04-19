import { PrismaService } from '@libs/prisma';
import { Inject, Injectable } from '@nestjs/common';
import {
  CreateLeadArgs,
  UpdateLeadArgs,
} from 'src/modules/lead/mutation/lead.dto';

@Injectable()
export class LeadMutationService {
  constructor(@Inject(PrismaService) private prisma: PrismaService) {}

  createLead(args: CreateLeadArgs) {
    const data = args.params;

    return this.prisma.lead.create({
      data,
    });
  }

  updateLead(args: UpdateLeadArgs) {
    const { leadId: id, ...data } = args.params;

    return this.prisma.lead.update({
      where: {
        id,
      },
      data,
    });
  }
}
