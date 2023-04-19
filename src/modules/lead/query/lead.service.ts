import { PaginationArgs } from '@common/models/pagination';
import { Inject, Injectable } from '@nestjs/common';
import { FetchLeadArgs } from 'src/modules/lead/query/lead.dto';
import { PrismaService } from 'src/modules/prisma/prisma.service';

@Injectable()
export class LeadQueryService {
  constructor(@Inject(PrismaService) private prisma: PrismaService) {}

  fetchLead(id: FetchLeadArgs) {
    throw new Error('Not implemented');
  }

  fetchLeads(args: PaginationArgs) {
    throw new Error('Not implemented');
  }
}
