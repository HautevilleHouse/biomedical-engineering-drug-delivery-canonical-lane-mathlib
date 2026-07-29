import BiomedicalEngineeringDrugDeliveryCanonicalLaneLean.CompartmentModels

namespace HautevilleHouse
namespace BiomedicalEngineeringDrugDeliveryCanonicalLaneLean

structure PharmacokineticEndpointPackage where
  targetConcentration : Prop
  therapeuticWindowLower : Prop
  therapeuticWindowUpper : Prop
  bioavailabilityMeasured : Prop
  endpointAchieved : Prop

structure PharmacokineticEndpointEvidence (Epkg : PharmacokineticEndpointPackage) where
  targetConcentrationClosed : Epkg.targetConcentration
  therapeuticWindowLowerClosed : Epkg.therapeuticWindowLower
  therapeuticWindowUpperClosed : Epkg.therapeuticWindowUpper
  bioavailabilityMeasuredClosed : Epkg.bioavailabilityMeasured
  endpointAchievedClosed : Epkg.endpointAchieved

def PharmacokineticEndpointClosed (Epkg : PharmacokineticEndpointPackage) : Prop :=
  Epkg.targetConcentration ∧ Epkg.therapeuticWindowLower ∧ Epkg.therapeuticWindowUpper ∧ Epkg.bioavailabilityMeasured ∧ Epkg.endpointAchieved

theorem pharmacokinetic_endpoint_closed_from_evidence (Epkg : PharmacokineticEndpointPackage) (E : PharmacokineticEndpointEvidence Epkg) : PharmacokineticEndpointClosed Epkg := by
  exact And.intro E.targetConcentrationClosed (And.intro E.therapeuticWindowLowerClosed (And.intro E.therapeuticWindowUpperClosed (And.intro E.bioavailabilityMeasuredClosed E.endpointAchievedClosed)))

theorem pharmacokinetic_endpoint_supplies_bioavailability (Epkg : PharmacokineticEndpointPackage) : Epkg.bioavailabilityMeasured :=
  Epkg.bioavailabilityMeasured

end BiomedicalEngineeringDrugDeliveryCanonicalLaneLean
end HautevilleHouse