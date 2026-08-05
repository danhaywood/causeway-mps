package causeway.verification;

import org.apache.causeway.applib.Identifier;
import org.apache.causeway.applib.id.LogicalType;
import org.apache.causeway.core.metamodel._testing.MetaModelContext_forTesting;
import org.apache.causeway.core.metamodel.facetapi.FacetHolder;
import org.apache.causeway.core.metamodel.facetapi.MethodRemover;
import org.apache.causeway.core.metamodel.facets.FacetFactory.ProcessClassContext;
import org.apache.causeway.core.metamodel.facets.object.mixin.MixinFacet;
import org.apache.causeway.core.metamodel.progmodel.ProgrammingModel;

/** Processes generated Java classes through the Causeway programming model. */
public final class GeneratedMixinVerifier implements AutoCloseable {
    private final MetaModelContext_forTesting metaModelContext;
    private final ProgrammingModel programmingModel;

    public GeneratedMixinVerifier(Object... services) {
        var builder = MetaModelContext_forTesting.builder();
        for (Object service : services) {
            builder.singleton(service);
        }
        metaModelContext = builder.build();
        programmingModel = metaModelContext.getProgrammingModel();
    }

    public MixinFacet process(Class<?> mixinType) {
        var facetHolder = FacetHolder.simple(
                metaModelContext,
                Identifier.classIdentifier(LogicalType.fqcn(mixinType)));
        var context = ProcessClassContext.forTesting(
                mixinType,
                MethodRemover.NOOP,
                facetHolder);

        programmingModel.streamFactories().forEach(factory -> factory.process(context));
        return facetHolder.getFacet(MixinFacet.class);
    }

    public String memberId(Class<?> mixinType) {
        return programmingModel.mixinNamingStrategy().memberId(mixinType);
    }

    @Override
    public void close() {
        if (metaModelContext.getSpecificationLoader() != null) {
            metaModelContext.getSpecificationLoader().disposeMetaModel();
        }
    }
}
