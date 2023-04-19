import { PaginationArgs } from '@common/models/pagination';
import { Inject, Injectable } from '@nestjs/common';
import { FetchLeadArgs } from 'src/modules/lead/query/lead.dto';
import { PrismaService } from 'src/modules/prisma/prisma.service';
import { paginatedResponse } from 'src/utils/paginated';

@Injectable()
export class LeadQueryService {
  constructor(@Inject(PrismaService) private prisma: PrismaService) {}

  fetchLead({ params }: FetchLeadArgs) {
    return this.prisma.lead.findUnique({
      where: {
        id: params.id,
      },
    });
  }

  fetchLeads({ pagination }: PaginationArgs) {
    return paginatedResponse(
      this.prisma,
      this.prisma.lead,
      {},
      'id',
      pagination,
    );
  }
}
