import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringDrugDeliveryCanonicalLaneLean

structure PharmacokineticCompartment where
  volumeOfDistribution : Prop
  eliminationRate : Prop
  absorptionRate : Prop
  bioavailability : Prop
  compartmentCount : Nat

structure PharmacokineticCompartmentEvidence (C : PharmacokineticCompartment) where
  volumeOfDistributionClosed : C.volumeOfDistribution
  eliminationRateClosed : C.eliminationRate
  absorptionRateClosed : C.absorptionRate
  bioavailabilityClosed : C.bioavailability
  compartmentCountClosed : C.compartmentCount = C.compartmentCount

def PharmacokineticCompartmentClosed (C : PharmacokineticCompartment) : Prop :=
  C.volumeOfDistribution ∧ C.eliminationRate ∧ C.absorptionRate ∧ C.bioavailability

theorem pharmacokinetic_compartment_closed_from_evidence (C : PharmacokineticCompartment) (E : PharmacokineticCompartmentEvidence C) :
    PharmacokineticCompartmentClosed C := by
  exact And.intro E.volumeOfDistributionClosed
    (And.intro E.eliminationRateClosed
      (And.intro E.absorptionRateClosed E.bioavailabilityClosed))

end BiomedicalEngineeringDrugDeliveryCanonicalLaneLean
end HautevilleHouse