import BiomedicalEngineeringDrugDeliveryCanonicalLaneLean.CompartmentModels

namespace HautevilleHouse
namespace BiomedicalEngineeringDrugDeliveryCanonicalLaneLean

structure BioavailabilityGeometrizationPackage where
  absorptionModel : Prop
  firstPassMetabolism : Prop
  fractionAbsorbed : Prop
  bioavailabilityCalculated : Prop

structure BioavailabilityGeometrizationEvidence (Z : BioavailabilityGeometrizationPackage) where
  absorptionModelClosed : Z.absorptionModel
  firstPassMetabolismClosed : Z.firstPassMetabolism
  fractionAbsorbedClosed : Z.fractionAbsorbed
  bioavailabilityCalculatedClosed : Z.bioavailabilityCalculated

def BioavailabilityGeometrizationClosed (Z : BioavailabilityGeometrizationPackage) : Prop :=
  Z.absorptionModel ∧ Z.firstPassMetabolism ∧ Z.fractionAbsorbed ∧ Z.bioavailabilityCalculated

theorem bioavailability_geometrization_closed_from_evidence (Z : BioavailabilityGeometrizationPackage) (E : BioavailabilityGeometrizationEvidence Z) : BioavailabilityGeometrizationClosed Z := by
  exact And.intro E.absorptionModelClosed (And.intro E.firstPassMetabolismClosed (And.intro E.fractionAbsorbedClosed E.bioavailabilityCalculatedClosed))

end BiomedicalEngineeringDrugDeliveryCanonicalLaneLean
end HautevilleHouse